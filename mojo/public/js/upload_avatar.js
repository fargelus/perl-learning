$(() => {
  const $avatar = $('#avatar');
  const $updBtn = $('#upd-btn');
  const isDisabled = $updBtn.prop('disabled');

  $avatar.change(() => {
    if (isDisabled) {
      $updBtn.prop('disabled', false);
    }
  });

  $updBtn.click((ev) => {
    ev.preventDefault();

    const fd = new FormData();
    fd.append('avatar', $avatar.prop('files')[0]);

    $.ajax({
      type: 'POST',
      url: '/update',
      data: fd,
      contentType: false,
      processData: false,
      success: (data) => {
        $('#avatar-upd-res')
          .empty()
          .html('<p>Аватарка обновлена</p>');
      },
      fail: () => {
        $('#avatar-upd-res')
          .empty()
          .html('<p>Не удалось обновить аватарку</p>');
      }
    });
  });
});
