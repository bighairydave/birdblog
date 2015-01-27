---
layout: post
title: Adding photos to a Jekyll blog
date: 2015-01-23
category: blogging
tags: [flickr,images,jekyll]
---

One thing a birdwatcher's blog often needs is photos, and that's not something that Jekyll is particularly good at out of the box.

Here are a few approaches:

## Brandon Mathis's Image Tag plugin

Brandon Mathis is the expert Jekyll hacker who is behind [Octopress](http://octopress.org/), and his [image tag plugin](https://github.com/imathis/octopress/blob/master/plugins/image_tag.rb) works for Jekyll.

Drop the file in your `_plugins` folder and you have access to a tag to easily insert images. The syntax is described with examples in the comments at the top of the Ruby file: you only need to specify a path to the image; other features are optional.

For[Textexpander](http://smilesoftware.com/TextExpander/index.html) users, here is a snippet to make life easier:

    {% raw %}{% img %filltext:name=class names (optional)% %filltext:name=URL:default=/path/to/image% %filltext:name=Width% %filltext:name=Height% "%filltext:name=Title%" "%filltext:name=alt text%" %}{% endraw %}

## Rob Wierzbowski's Image tag plugin

Another, similar plugin [can be found here](https://github.com/robwierzbowski/jekyll-image-tag). This is much more sophisticated, and will resize your images. Instructions are supplied: at the time of writing I haven't really gone into it.

## Flickr integration

Both of these Image Tag plugins have one thing in common: you have to have all your photos stored within your Jekyll project on your computer, and after a few years of that it's going to become a bit of a nuisance! It's probably better in the long run to manage your photos somewhere else and just link to them  from your Jekyll blog.

There are plenty of people interested in connecting Flickr to Jekyll. Here are some of the available projects:

* [Jesper Rasmussen](http://jesperrasmussen.com/2013/07/29/setting-up-flickr-galleries-in-octopress/) - galleries.
* [Neil Kandalgaonkar](https://github.com/neilk/octopress-flickr) - single images or sets.
* [Jonas Brusman](http://jonasforsberg.se/2012/04/15/flickr-plugin-for-jekyll)
* [Pixarea](http://blog.pixarea.com/2012/07/fetch-images-from-flickr-to-show-in-octopress-slash-jekyll)
* [Keith Marran](http://www.marran.com/tech/integrating-flickr-and-jekyll)
* [Jeremy 'j0k3r'](https://github.com/j0k3r/jekyll-flickr-photoset) - for photosets.
* [Christian Nunciato](https://github.com/cnunciato/jekyll-flickr) - for single images.

I haven't looked at them all yet, but the last two on the list leapt out at me in terms of simplicity.

I tried out the last one and it seems to have worked well enough:

{% flickr_photo 15024208240 "Small 320" %}

However, I think it can be improved so I intend to make some modifications. My version is [here](https://github.com/bighairydave/jekyll-flickr), although at the time of writing all I have done is add some class hooks for styling.
