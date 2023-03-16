const anchor = document.getElementById('add-ingredient');

anchor.addEventListener('click', async (ev) => {
    ev.preventDefault();

    const token = document.getElementById('csrf-token');
    const quantity = document.getElementById('quantity');

    const form = new FormData();
    form.append("food_id", anchor.closest('tr').id.match(/\d+/)[0]);
    form.append("authenticity_token", token.value);
    form.append("quantity", quantity.textContent.match(/\d+/)[0]);

    const res = await fetch(window.location.href, {
        method: 'POST',
        body: form
    });

    if (res.status === 201) {
        window.location.href = window.location.href.replace(/\w+$/, '')
    }
});