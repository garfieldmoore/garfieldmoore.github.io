---
layout: post
title: Developers are not customers
date: 2011-02-09 21:23:43.000000000 +00:00
categories: User Stories

published: true
type: post
featured: false
author: garfieldmoore

image: 'http://dd03isve2g8o3.cloudfront.net/lose_customer.jpeg'
---
I've been on a number of projects that used 'Technical' user stories.  One incarnation of the 'technical story' I saw on a recent project was the technical debt story.  It went something like this;

'As a developer, I want to handle exceptional cases, so that the software it resilient'

With a little digging it transpired that the previous iterations stories had been developed without accounting for possible failures due to unavailable resources (networks, databases etc).

The often quoted definition of done is 'The simplest thing that works'.  Dan North elaborated this as '...with a sustainable eco-system...' [of code].

So it seems to me that these developer stories existed because the previous stories had been completed without this sustainable foundation.

As developers, we are being paid to produce software (by our customers).  Therefore, any story that has the developer as the role should be viewed with suspicion.
