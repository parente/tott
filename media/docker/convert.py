#!/usr/bin/env python
import sys
import os
import envoy

def usage():
    print 'convert.py [mp3_to_ogg|mov_to_ogv|mov_main_profile]'

def mp3_to_ogg():
    for root, dirs, files in os.walk("audio"):
        for fn in files:
            if not fn.endswith('mp3'): continue
            in_fn = os.path.join(root, fn)
            name, ext = fn.split('.')
            out_fn = os.path.join(root, name + '.ogg')
            if not os.path.isfile(out_fn):
                print in_fn, out_fn
                r = envoy.run('ffmpeg -i %s -acodec libvorbis -b:a 64k %s' % (in_fn, out_fn))
                print r.std_err

def mov_to_ogv():
    for root, dirs, files in os.walk("video"):
        for fn in files:
            if not fn.endswith('mov'): continue
            in_fn = os.path.join(root, fn)
            name, ext = fn.split('.')
            out_fn = os.path.join(root, name + '.ogv')
            if not os.path.isfile(out_fn):
                print in_fn, out_fn
                r = envoy.run('ffmpeg2theora %s' % in_fn)
                print r.std_err

def mov_main_profile(in_fn, out_fn):
    r = envoy.run('ffmpeg -i %s -profile main -acodec copy -vcodec libx264 %s' % (in_fn, out_fn))
    print r.std_err

if __name__ == '__main__':
    try:
        fn = sys.argv[1]
    except IndexError:
        usage()
    else:
        try:
            globals()[fn](*sys.argv[2:])
        except KeyError:
            usage()
        else:
            print 'Done'