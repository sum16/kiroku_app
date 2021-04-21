$(function () {
  $('.slick').slick({
    dots: true,

  });

  $('.slick-dots li').on('mouseover', function () {
    $('.slick').slick('goTo', $(this).index());
  });
});
