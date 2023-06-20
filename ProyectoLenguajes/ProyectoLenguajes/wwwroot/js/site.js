function showEditTooltip() {
    var tooltip = document.getElementById('edit-tooltip');
    tooltip.style.display = 'block';
}

function openPopup() {
    var popup = document.getElementById('popup');
    popup.style.display = 'block';

    // Cargar los iconos al abrir el popup
    filterIcons();
    filterIconsU();
}

function closePopup() {
    var popup = document.getElementById('popup');
    popup.style.display = 'none';
}

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('suggestions-input').addEventListener('keyup', function () {
        console.log('Tecla presionada');
        filterIcons();
        filterIconsU();
    });
});

function filterIcons() {
    var searchText = document.getElementById('suggestions-input').value.toLowerCase();

    // Realizar la solicitud AJAX al controlador para obtener la lista de iconos filtrados 
    $.ajax({
        url: '/SuperAdmin/FilterIcons',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var filteredIcons;
            if (searchText === '') {
                // Si no hay texto de búsqueda, mostrar todos los iconos
                filteredIcons = data;
            } else {
                // Filtrar los iconos según el texto de búsqueda
                filteredIcons = data.filter(function (icon) {
                    var iconName = icon.nameIcon.toLowerCase();
                    return iconName.includes(searchText);
                });
            }

            var iconMatrix = document.getElementById('icon-matrix');
            iconMatrix.innerHTML = '';

            //for (var i = 0; i < filteredIcons.length; i++) {
            //    var icon = filteredIcons[i];
            //    var iconElement = document.createElement('div');
            //    iconElement.classList.add('icon');
            //    iconElement.innerHTML = '<img src="' + icon.url + '" alt="' + icon.nameIcon + '">';

            //    iconMatrix.appendChild(iconElement);
            //}

            // Genera los elementos icon y establece el atributo data-url
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

            // Obtener todos los elementos con la clase "icon" dentro del popup
            var selectedIconInput = document.getElementById('selected-icon-url');
            var imgInput = document.getElementById('img');
            var icons = document.querySelectorAll('#icon-matrix .icon');

            // Adjuntar un controlador de eventos a cada elemento
            icons.forEach(function (icon) {
                icon.addEventListener('click', function () {
                    var url = icon.getAttribute('data-url');
                    // Actualizar la imagen del popup con la URL seleccionada
                    document.getElementById('edit-icon').src = url;
                    // Actualizar el valor del input hidden con la URL seleccionada
                    selectedIconInput.value = url;
                    // Actualizar el valor del input visible con la URL seleccionada
                    imgInput.value = url;
                    //document.getElementById('selected-icon-url').value = url;
                    closePopup();
                });
            });
        },
        error: function (xhr, status, error) {
            console.log(error); // Manejar el error en caso de que ocurra
        }
    });
}

function filterIconsU() {
    var searchText = document.getElementById('suggestions-input').value.toLowerCase();

    // Realizar la solicitud AJAX al controlador para obtener la lista de iconos filtrados 
    $.ajax({
        url: '/User/FilterIcons',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var filteredIcons;
            if (searchText === '') {
                // Si no hay texto de búsqueda, mostrar todos los iconos
                filteredIcons = data;
            } else {
                // Filtrar los iconos según el texto de búsqueda
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

            // Obtener todos los elementos con la clase "icon" dentro del popup
            var selectedIconInput = document.getElementById('selected-icon-url');
            var imgInput = document.getElementById('img');
            var icons = document.querySelectorAll('#icon-matrix .icon');

            // Adjuntar un controlador de eventos a cada elemento
            icons.forEach(function (icon) {
                icon.addEventListener('click', function () {
                    var url = icon.getAttribute('data-url');
                    // Actualizar la imagen del popup con la URL seleccionada
                    document.getElementById('edit-icon').src = url;
                    // Actualizar el valor del input hidden con la URL seleccionada
                    selectedIconInput.value = url;
                    // Actualizar el valor del input visible con la URL seleccionada
                    imgInput.value = url;
                    //document.getElementById('selected-icon-url').value = url;
                    closePopup();
                });
            });
        },
        error: function (xhr, status, error) {
            console.log(error); // Manejar el error en caso de que ocurra
        }
    });
}
