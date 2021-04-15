import { post } from "jquery";

$(function () {
  $('.js-text_field').on('keyup', function () {
    var title = $.trim($(this).val());

    $.ajax({
      type: 'GET',
      url: "/caregiver/posts/:post_id/searches",
      data: { title: title },
      dataType: 'json'
    })

      .done(function (data) {
        $('.js-messages li').remove();

        $(data).each(function (i, post) {
          $('.js-messages').append(
            `<li class="posts"><a href="/caregiver/posts/${post.id}">${post.title}</a></li>`
          );
        });
      })

  });
});
