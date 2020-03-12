const initSwapFlatpickr = () => {

  const swapStartDateInput = document.getElementById('swap_request_start_date');
  const swapEndDateInput = document.getElementById('swap_request_end_date');

  // Check that the query selector id matches the one you put around your form.
  if (swapStartDateInput) {
    console.log('im in the file')
  const unavailableDates = JSON.parse(document.querySelector('#flat-swap_request-dates').dataset.unavailable)
  swapEndDateInput.disabled = true

  flatpickr(swapStartDateInput, {
    minDate: "today",
    disable: unavailableDates,
    dateFormat: "Y-m-d",
  });


  swapStartDateInput.addEventListener("change", (e) => {
    if (swapStartDateInput != "") {
      swapEndDateInput.disabled = false
    }
    flatpickr(swapEndDateInput, {
      minDate: e.target.value,
      disable: unavailableDates,
      dateFormat: "Y-m-d"
      });
    })
  };
}

export { initSwapFlatpickr };
