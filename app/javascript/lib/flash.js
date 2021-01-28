export default flash

const flash = $(document).on('turbolinks:load', () =>
  $('.alert').delay(5000).slideUp(500, () => $('.alert').alert('close'))
);