$(() => {
  $('#login-form, #reg-form').submit((ev) => {
    ev.preventDefault();

    const $form = $(ev.target);
    const username = $form.find('input[name="username"]').val();
    const pwd = $form.find('input[name="password"]').val();

    const data = {
      user: username,
      password: pwd,
    };

    const $userError = $('#user-error');
    const hasError = (status) => {
      const isLoginForm = $form.attr('id') === 'login-form';
      const isRegForm = $form.attr('id') === 'reg-form';

      const isLoginError = (status === 'empty' && isLoginForm);
      const isRegError = (status === 'exist' && isRegForm);

      return isLoginError || isRegError;
    }

    $.ajax({
      type: "POST",
      url: '/user_exist',
      data: JSON.stringify(data),
      dataType: 'application/json',
      contentType: 'application/json',
    }).always((data) => {
      let response = data.responseText;
      response = JSON.parse(response);
      const { status } = response;

      if (hasError(status)) {
        $userError.show();
      } else {
        $form.off('submit');
        $form.submit();
      }
    });
  });
});
