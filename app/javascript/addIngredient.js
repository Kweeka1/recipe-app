const anchors = document.querySelectorAll('.add-ingredient');

anchors.forEach((anchor) =>{
    anchor.addEventListener('click', async (ev) => {
        ev.preventDefault();

        const item = anchor.closest('tr')

        const token = document.getElementById('csrf-token');
        const quantity = item.querySelector('.quantity').value;

        if (quantity === '') return;

        const form = new FormData();
        form.append("food_id", item.id.match(/\d+/)[0]);
        form.append("authenticity_token", token.value);
        form.append("quantity", quantity);

        const res = await fetch(window.location.href, {
            method: 'POST',
            body: form
        });

        if (res.status === 201) {
            window.location.href = window.location.href.replace(/\w+$/, '')
        }
    });
});