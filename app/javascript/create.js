document.addEventListener("DOMContentLoaded", function () {
  const bookList = document.getElementById("book-list");
  const addBookButton = document.getElementById("add-book");
  const bookTitreInput = document.getElementById("book-titre");
  const bookAuteurInput = document.getElementById("book-auteur");

  addBookButton.addEventListener("click", function () {
    const titre = bookTitreInput.value;
    const auteur = bookAuteurInput.value;

    if (titre && auteur)
    {
      const bookItem = document.createElement("li");
      bookItem.innerHTML = `<span>${titre}</span> - ${auteur} <button class="delete">Supprimer</button>`;
      bookList.appendChild(bookItem);

      // Efface les champs de saisie
      bookTitreInput.value = "";
      bookAuteurInput.value = "";

      // Ajoute un gestionnaire d'événement pour supprimer le livre
      const deleteButton = bookItem.querySelector(".delete");
      deleteButton.addEventListener("click", function () {
        bookList.removeChild(bookItem);
      });
    }
  });
});
