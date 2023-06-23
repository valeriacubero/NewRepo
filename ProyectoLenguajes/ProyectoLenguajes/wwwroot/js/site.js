//To show in the profile icon that can be edited, but not funka: V
function showEditTooltip() {
    var tooltip = document.getElementById('edit-tooltip');
    tooltip.style.display = 'block';
}

//To open the popup every time it is called
function openPopup() {
    var popup = document.getElementById('popup');
    popup.style.display = 'block';

    // Load the icons when opening the popup
    filterIcons();
    filterIconsU();
}

//To close the popup, although it seems to me that I no longer use it as such
function closePopup() {
    var popup = document.getElementById('popup');
    popup.style.display = 'none';
}

//To write to the input and detect letter by letter
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('suggestions-input').addEventListener('keyup', function () {
        console.log('Tecla presionada');
        filterIcons();
        filterIconsU();
    });
});

//Here we load the matrix, we can filter and select
function filterIcons() {
    var searchText = document.getElementById('suggestions-input').value.toLowerCase();

    // Make AJAX request to controller to get list of filtered icons
    $.ajax({
        url: '/SuperAdmin/FilterIcons',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var filteredIcons;
            if (searchText === '') {
                // If there is no search text, show all icons
                filteredIcons = data;
            } else {
                // Filter icons based on search text
                filteredIcons = data.filter(function (icon) {
                    var iconName = icon.nameIcon.toLowerCase();
                    return iconName.includes(searchText);
                });
            }

            var iconMatrix = document.getElementById('icon-matrix');
            iconMatrix.innerHTML = '';

            // Generate the icon elements and set the data-url attribute
            filteredIcons.forEach(function (url) {
                var icon = document.createElement('div');
                icon.className = 'icon';
                icon.setAttribute('data-url', url.url);

                var img = document.createElement('img');
                img.src = url.url;
                img.alt = 'img';
                img.onclick = function () {
                    selectIcon(this);
                };

                icon.appendChild(img);
                iconMatrix.appendChild(icon);
            });

            // Get all elements with class "icon" inside the popup
            var selectedIconInput = document.getElementById('selected-icon-url');
            var imgInput = document.getElementById('img');
            var icons = document.querySelectorAll('#icon-matrix .icon');

            // Attach an event handler to each element
            icons.forEach(function (icon) {
                icon.addEventListener('click', function () {
                    var url = icon.getAttribute('data-url');
                    // Update the popup image with the selected URL
                    document.getElementById('edit-icon').src = url;
                    // Update the value of the hidden input with the selected URL
                    selectedIconInput.value = url;
                    // Update visible input value with selected URL
                    imgInput.value = url;
                    closePopup();
                });
            });
        },
        error: function (xhr, status, error) {
            console.log(error); // Handle the error in case it occurs
        }
    });
}

function filterIconsU() {
    var searchText = document.getElementById('suggestions-input').value.toLowerCase();

    // Make AJAX request to controller to get list of filtered icons
    $.ajax({
        url: '/User/FilterIcons',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var filteredIcons;
            if (searchText === '') {
                // If there is no search text, show all icons
                filteredIcons = data;
            } else {
                // Filter icons based on search text
                filteredIcons = data.filter(function (icon) {
                    var iconName = icon.nameIcon.toLowerCase();
                    return iconName.includes(searchText);
                });
            }

            var iconMatrix = document.getElementById('icon-matrix');
            iconMatrix.innerHTML = '';

            filteredIcons.forEach(function (url) {
                var icon = document.createElement('div');
                icon.className = 'icon';
                icon.setAttribute('data-url', url.url);

                var img = document.createElement('img');
                img.src = url.url;
                img.alt = 'img';
                img.onclick = function () {
                    selectIcon(this);
                };

                icon.appendChild(img);
                iconMatrix.appendChild(icon);
            });

            // Get all elements with class "icon" inside the popup
            var selectedIconInput = document.getElementById('selected-icon-url');
            var imgInput = document.getElementById('img');
            var icons = document.querySelectorAll('#icon-matrix .icon');

            // Attach an event handler to each element
            icons.forEach(function (icon) {
                icon.addEventListener('click', function () {
                    var url = icon.getAttribute('data-url');
                    // Update the popup image with the selected URL
                    document.getElementById('edit-icon').src = url;
                    // Update the value of the hidden input with the selected URL
                    selectedIconInput.value = url;
                    // Update visible input value with selected URL
                    imgInput.value = url;
                    closePopup();
                });
            });
        },
        error: function (xhr, status, error) {
            console.log(error); // Handle the error in case it occurs
        }
    });
}
