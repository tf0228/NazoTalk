$(function () {
  $('#hint-1').on('click', () => {
    $('#hint-1-text').fadeToggle();
  });
});

$(function () {
  $('#hint-2').on('click', () => {
    $('#hint-2-text').fadeToggle();
  });
});

$(function () {
  $('#hint-3').on('click', () => {
    $('#hint-3-text').fadeToggle();
  });
});

$(function () {
  $('#show-answer').on('click', () => {
    $('#question-answer').fadeToggle();
  });
});


$(function(){
  // inputのidから情報の取得
  $('#question_image').on('change', function (e) {
  // ここから既存の画像のurlの取得
    var reader = new FileReader();
    reader.onload = function (e) {
      $(".question-image").attr('src', e.target.result);
    }
  // ここまで
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
  });
});

$(function(){
  $('#question_answer_image').on('change', function (e) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $(".answer-image").attr('src', e.target.result);
    }
    reader.readAsDataURL(e.target.files[0]);
  });
});