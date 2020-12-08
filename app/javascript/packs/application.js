// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


import "bootstrap"

//delete attached image in edit and create new stuffs
//(function (window, $) {
//  var FILE_ICON_URL = 'image-not-found.png'
//
//  function addFileToNewInput(file, newInput) {
//    if (!newInput) { return }
//
//    var dataTransfer = new DataTransfer()
//    dataTransfer.items.add(file)
//    newInput.files = dataTransfer.files
//  }
//
//  function addSrcToPreview(file, preview) {
//    if (!preview) { return }
//
//    if (file.type.match(/image/)) {
//      var reader = new FileReader()
//      reader.onload = function (e) { preview.src = e.target.result }
//      reader.readAsDataURL(file)
//    } else {
//      preview.src = FILE_ICON_URL
//    }
//  }
//
//  function breakIntoSeparateFiles(input, targetSelector, templateSelector) {
//    var $input = $(input)
//    var templateHtml = $(templateSelector).html()
//
//    if (!input.files) { return }
//
//    for(var file of input.files) {
//      var $newFile = $(templateHtml).appendTo(targetSelector)
//      addFileToNewInput(file, $newFile.find("input")[0])
//      addSrcToPreview(file, $newFile.find("img")[0])
//    }
//
//    $input.val([])
//  }
//
//  window.breakIntoSeparateFiles = breakIntoSeparateFiles
//})(window, jQuery);