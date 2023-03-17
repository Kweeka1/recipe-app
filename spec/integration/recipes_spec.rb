require_relative '../rails_helper'

RSpec.describe 'recipes', type: :system do
  before do
    user = User.new(name: 'martin', email: 'martin@gmail.com', password: '123456', password_confirmation: '123456')
    user.skip_confirmation!
    user.save!
  end

  context 'User authentication' do
    it 'Un-authenticated user should be redirected to login page' do
      visit root_path
      expect(page).to have_content('Login Page')
    end

    it 'User should be able to login' do
      visit root_path
      within '#new_user' do
        fill_in 'Email', with: 'martin@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
      expect(page).to have_content 'Public Recipes'
    end
  end

  context 'Recipes pages' do
    before do
      visit root_path
      within '#new_user' do
        fill_in 'Email', with: 'martin@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'User should be able to visit public recipes page' do
      visit root_path
      expect(page).to have_content 'Public Recipes'
    end

    it 'User should be able to visit recipes page' do
      visit recipes_path
      expect(page).to have_content 'My Recipes'
    end
  end

  context 'Recipe creation' do
    before do
      visit root_path
      within '#new_user' do
        fill_in 'Email', with: 'martin@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'
    end

    it 'User should be able to create a recipe' do
      visit new_recipe_path
      within '#recipe-form' do
        fill_in 'Name', with: 'Pasta'
        fill_in 'Preparation time', with: '10'
        fill_in 'Cooking time', with: '45'
        fill_in 'Description', with: 'How to make pasta'
        page.check('recipe_public')
      end
      click_button 'Save'
      expect(page).to have_current_path "/recipes/#{Recipe.last.id}"
    end
  end

  context 'Recipe visibility' do
    before do
      visit root_path
      within '#new_user' do
        fill_in 'Email', with: 'martin@gmail.com'
        fill_in 'Password', with: '123456'
      end
      click_button 'Log in'

      visit new_recipe_path
      within '#recipe-form' do
        fill_in 'Name', with: 'Pasta'
        fill_in 'Preparation time', with: '10'
        fill_in 'Cooking time', with: '45'
        fill_in 'Description', with: 'How to make pasta'
        page.check('recipe_public')
      end
      click_button 'Save'
    end

    it 'User should be able to change recipe\'s visibility' do
      find('#visibility').click
      sleep 1
      visit public_recipes_path
      expect(page).not_to have_content 'Pasta'
    end

    it 'User should be able to see his recipe in my recipes page' do
      visit recipes_path
      find(:xpath, '/html/body/div[2]/div[1]/h3/a').click
      expect(page).to have_current_path "/recipes/#{Recipe.last.id}"
    end
  end
end
