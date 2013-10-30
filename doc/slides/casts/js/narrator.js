(function() {
    var top = document.querySelector('.reveal');
    var narrator = document.createElement('div');
    narrator.className = 'narrator';
    var audio = document.createElement('audio');
    audio.setAttribute('controls', true);
    audio.setAttribute('autoplay', true);
    narrator.appendChild(audio);
    top.appendChild(narrator);

    var set_narration = function(slide) {
        audio.pause();
        if(slide.dataset && slide.dataset.narration) {
            var url = Reveal.getConfig().narrationRoot + slide.dataset.narration;
            narrator.classList.remove('disabled');
            narrator.classList.remove('hidden');
            audio.removeAttribute('disabled');
            audio.setAttribute('src', url);
        } else {
            audio.setAttribute('disabled');
            if(slide.querySelector('video')) {
                narrator.classList.add('hidden');
            } else {
                narrator.classList.add('disabled');
            }
        }
    };

    var set_jsbin = function(slide) {
        console.log(slide);
        if(slide.dataset && slide.dataset.jsbin) {
            var path = slide.dataset.jsbin;
            var iframe = slide.querySelector('.jsbin-embed');
            console.log('src', iframe.src);
            if(!iframe.src) {
                iframe.src = 'http://jsbin.com'+path;
            }
        }
    };

    Reveal.addEventListener('slidechanged', function(event) {
        set_narration(event.currentSlide);
        set_jsbin(event.currentSlide);
    });
    set_narration(Reveal.getCurrentSlide());
    set_jsbin(Reveal.getCurrentSlide());
}());