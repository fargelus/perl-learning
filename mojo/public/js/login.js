$(() => {
  $('#login-form').submit((ev) => {
    ev.preventDefault();

    const $form = $(ev.target);
    const username = $form.find('input[name="username"]').val();
    const pwd = $form.find('input[name="password"]').val();

    const data = {
      user: username,
      password: pwd,
    };

    const $loginError = $('#login-error');

    $.ajax({
      type: "POST",
      url: '/user_exist',
      data: JSON.stringify(data),
      dataType: 'application/json',
      contentType: 'application/json',
    }).always((data) => {
      let response = data.responseText;
      response = JSON.parse(response);
      if (response.status === 'fail') {
        $loginError.show();
      } else {
        $form.off('submit');
        $form.submit();
      }
    });
  });
});
