(function() {
    var ext = '.mp3';
    var top = document.querySelector('.reveal');
    var narrator = document.createElement('div');
    narrator.className = 'narrator';
    var audio = document.createElement('audio');
    audio.setAttribute('controls', true);
    audio.setAttribute('autoplay', true);
    narrator.appendChild(audio);
    top.appendChild(narrator);

    // from diveintohtml5 appendix a
    if(!!(audio.canPlayType && audio.canPlayType('audio/mpeg;').replace(/no/, ''))) {
        ext = '.mp3';
    } else if(!!(audio.canPlayType && audio.canPlayType('audio/ogg; codecs="vorbis"').replace(/no/, ''))) {
        ext = '.ogg';
    } else {
        console.error('browser does not support mp3 or ogg');
    }
    console.log('using', ext, 'audio');

    var set_narration = function(slide) {
        audio.pause();
        if(slide.dataset && slide.dataset.narration) {
            var url = Reveal.getConfig().narrationRoot + slide.dataset.narration + ext;
            narrator.classList.remove('disabled');
            narrator.classList.remove('hidden');
            audio.removeAttribute('disabled');
            audio.setAttribute('src', url);
        } else {
            audio.setAttribute('disabled', true);
            if(slide.querySelector('video')) {
                narrator.classList.add('hidden');
            } else {
                narrator.classList.add('disabled');
            }
        }
    };

    var set_jsbin = function(slide) {
        if(slide.dataset && slide.dataset.jsbin) {
            var path = slide.dataset.jsbin;
            var iframe = slide.querySelector('.jsbin-embed');
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