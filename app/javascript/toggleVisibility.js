function toggleVisibility() {
    const visibility = document.getElementById('visibility');
    const token = document.getElementById('csrf-token');

    visibility.textContent === "true" ? visibility.textContent = "false" : visibility.textContent = "true";

    const form = new FormData();
    form.append("visibility", visibility.textContent);
    form.append("authenticity_token", token.value);

    fetch(window.location.href + '/toggle_visibility', {
        method: 'POST',
        body: form
    });
}