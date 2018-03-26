---
layout: post
title: Code tag cloud
date: 2015-05-20 08:51:53
categories:	".Net"
image: '/images/posts/tag_cloud.jpeg'

---

I thought it would be a bit of fun to pass my code through a tag cloud creator. I thought it might give some insights into the domain language.

I used [Boomerang](https://github.com/garfieldmoore/Boomerang/) for this experiment.

I merged the projects class files into one on the command line;

	for /r ".\boomerang.host" %f in (*.cs) do type %f >> merged_code.txt

Then when over to [tagCrowd.com](http://www.tagcrowd.com/) and created the image below.

![tag crowd](/assets/images/boomerang_tag_cloud.gif)

I didn't learn much about my project but it was a bit of fun and maybe I'll do some renaming the next time I'm in the code.
