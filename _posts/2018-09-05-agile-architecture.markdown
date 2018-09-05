---
layout: post
title: Agile Architecture
date: 2018-09-05T11:16:20+01:00
categories: technology
published: true
type: post
featured: false
author: garfieldmoore

image: '/images/posts/Agile-Architecture-1920x999.jpg'
---

I've often thought that agile teams miss oportunities or increase technical debt with a lack of architectural maturity.

This was reinforced last year when I was running a series of eXtreme Programming workshops for teams in a large consultancy.  During one of these I was asked a seemingly innocuous question;

'When do you do architecture in agile teams'.

This question spawned a mini-workshop where we walked through an example project and talked about when and why we would do architecture.  This seemed to help the team and was the catalyst for me considering about how agile fits into architecture.

I started thinking about why the team would have this uncertainty of when to do architecture.  It occurred to me that the teams I've worked with have a lot of variance in their architectural maturity.

Why should this be?

#### When do agile teams do architecture
The usual advise for agile teams is that you do 'Just enough' architecture and that you should do this 'all the time'.

This lack of guidance usually means that teams infer architecture should be intertwined with the normal story lifecycle.  This seems quite natural and I've worked with many teams where this works.  

However, the problem is that this is dependant on the teams maturity or the delivery priorities.  Often if one or two senior engineers leave the architecture practises degrade because they are not explicit.

There are other places in the software development lifecycle that are suitable. For example, I started advocating the release planning stage as a convenient place to make architectural concerns more visible.

## The agile architecure gap
After thinking about this teams question and the reasons behind it I came to the conclusion that agile practises do not manage architectural risk as well as other types of risk.

Architecure, and agile software developemt methods manage different kinds of risk; agile manages delivery risk and architecure and XP manage technical risks at different levels of granularity.

XP is a feature based development method; the focus is on feature delivery.  Of course XP and agile both manages risk.  If they didn't all but the simplest agile projects would fail.

However, XP is opinionated about the risks it manages.  It focuses risk around the most important risks to many projects; requirements risk and sustainability risk.

This is highlighted by some of the pracises;

  * Stories and iterations manage requirements and delivery risks
  * Spikes manage knowledge and team capability risk
  * TDD manages detailed design manage risks around design and internal sustainability

None of these explicitly manage architectural risk.

## Opportunities for Architecture
Although you don't need to create models or perform other archtictural activities 'all the time', you do need to be aware of the impact new features may have on your architecure.  

Not doing so will result in lost opportunities that make future features harder to implement or increase technical debt.  Left unmanaged this will introduce delivery risk into your projects.

There are a number of places in the software development life-cycle for architecture.  Some of these are discussed below.

#### Manage architectural concerns in the backlog
Some teams I've worked with have tried to manage architectural concerns in the backlog.  Often creating stories when they spot issues in the architecture created by the current story.

I think there are a number of issues with this approach;
* The product owner becomes dependant on technical input to prioritise the backlog.
* It defers technical work and loses the benefits for the current story.

#### Intertwine it with stories
A lot of teams can be successful doing architecture 'all the time' as part of thier story development life-cycle.  

However, often by the time the team sees a story, delivery expectations have already been set with other parts of the business.

This can make it harder for teams to go back and reset these expectations when they realise the story impacts the architecture.

Again, this often results in lost opportunities or increased technical debt.

#### Release management
To get early sight of architectural impact I've advocated having the teams senior engineers involved in the release management meetings.

This has made the most sense in a number of teams I've worked and there are other benefits in having the technical stakeholders involved earlier.

## Conclusion
Where a team does architecture depends on the team, and the project context.  I've worked with teams that do architecture 'all the time'.

However, all too often delivery imperatives or other forces mean that teams miss opportunities resulting in wasted effort or increased technical debt.

For the teams I've worked with it has made most sense to map the coming features onto the architecture during release planning activities.  

This enables the team to spot gaps or opportunities early in the developmet cycle.  This becomes a natural part of the release planning activities and makes architecture more visible to stakeholders.
