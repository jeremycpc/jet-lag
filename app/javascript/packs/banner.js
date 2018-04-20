let bgImgs = document.querySelectorAll(".banner img");
bgImgs = Array.prototype.slice.call(bgImgs);

function bgFader(images) {
  images.map((img, i) => {
    let count = i + 1;
    setTimeout(function() {
      img.style.opacity = 0;

      if (count === images.length) {
        images.map(img => {
          img.style.opacity = 1;
        });
        bgFader();
      }
    }, count * 5000);
  });
}
bgFader(bgImgs)
