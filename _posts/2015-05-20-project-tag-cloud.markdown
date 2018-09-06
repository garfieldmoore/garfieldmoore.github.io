---
layout: post
title: Code tag cloud
date: 2015-05-20 08:51:53
categories:	".Net"
image: '/images/posts/tag_cloud.jpeg'

published: true
type: post
featured: false
author: garfieldmoore

---
One of the most valueable concepts in Domain Driven Design is the notion of the ubiquitous language.  

This is the idea that both technical and non technical stakeholders should be using the same language for the problem domain.  Furthermore, the terms and nomenclature used should be represented in the code.

One day when I was thinking about this I realised programmers have no way of gauging how well they do this.  I wondered if it is possible to see how well the ubiquitous language is represented in the code.

I came up with the idea of generating a tag cloud for one of my projects.  I thought this would be a simple way of seeing how many domain terms were used in comparison to technical jargon.

I used [Boomerang](https://github.com/garfieldmoore/Boomerang/) for this experiment.  I created Boomerang to make it easy to mock out external API dependencies when writing acceptance tests.  The idea is that you define responses for your expected web requests in your tests.  

This allows your tests to configure the correct request / response for the scenario under test without the need for a real test service.

To create the tag cloud I merged the projects class files into one on the command line;

``` script
	for /r ".\boomerang.host" %f in (*.cs) do type %f >> merged_code.txt
```

Then went over to [tagCrowd.com](http://www.tagcrowd.com/) to create the below tag cloud image;

![tag crowd](/assets/images/boomerang_tag_cloud.gif)

I was quite happy to notice the prominence of a number of domain concepts in the tag cloud.  Terms like Request, Response, StatusCode Host, and Headers are all terms I would expect in the language of this project.

The technical jargon is limited to references to String, and Namespace having perhaps too much prominence.  

I may review these to see if I can reduce there prominence at some point.  Although there is probably not a lot to be done about these as they are keywords in the language.  

Howoever, it's possible that I may be using 'String' where I should be using a custom type.

Overall, I was happy with the state of my code and it's use of the domain language.
