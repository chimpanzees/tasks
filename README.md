# Tasks

Tasks is a very simple application for managing tasks for a small team. It has been
developed for use by the [aTech Media](http://atechmedia.com) team so that minor/quick
tasks can be tracked for the whole team.

## Key aims

* Easy to use interface
* Easily add new tasks and assign one or more users to it
* Assign tasks to "projects"
* Assign tasks a deadline and/or a priority
* All users can authenticate with aTech Identity
* Allow assignments and project links to be created easily on task creation using twitter
  style syntax. When referencing a project, user or specifying a deadline it should be 
  removed from the actual task and store separately.
* Provide pre-set views including:
  * My Tasks (all tasks which are assigned to me and could be completed today)
  * Today's Tasks (tasks which must be completed today or by today)
  * Everyone's Tasks (all tasks which could be completed today)
  * My Upcoming Tasks (all tasks which are assigned to be and must be completed in the future)
  * _Perhaps others as required_

## Example Tasks

A task assigned to a specific user and a specific project. If the project doesn't exist, a 
new one should be created.

```
Create documentation for Deliver's API @charlie #deliver
```

A task with a specific deadline which means it can occur at any point between now and the
date specified. The time should be human friendly.

```
Phone Thirsty Work and order new water @danq by:tomorrow
```

A task which must be carried out on a specific day. If the task isn't assigned to anyone
it should be visible to everyone until someone takes ownership.

```
Take the bins out on:friday
```

