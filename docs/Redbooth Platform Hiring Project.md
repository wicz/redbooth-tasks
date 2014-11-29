# Redbooth Platform Hiring Project

The purpose of this project is to understand your level of competence in Rails and your knowledge about APIs as a consumer and also as a provider.

The goal of the following tasks is to implement code that will perform what is asked. All feedback is much appreciated including any questions or comments related with the given task.

Here are some resources that might help you complete this project:

* [Redbooth API documentation](https://redbooth.com/api/)
* [OmniAuth Redbooth](https://github.com/teambox/omniauth-redbooth)
* [Redbooth API Ruby SDK](https://github.com/teambox/redbooth-ruby)
* [OAuth2 Specification](http://oauth.net/2/)

And now, here are the tasks. Enjoy!

## Authorize a user against Redbooth

Create a stand-alone Rails application with a public and a protected resource. To access the protected resource users should first authorize successfully against Redbooth using OAuth2.

## Present a list of all the Redbooth tasks assigned to the user

After completing the first task, the protected resource should be updated to present all the tasks that are assigned to the authorized user. Displayed information should include, at least, each task name, description, date and time of its creation and status (open, resolved, etc.).

## Let the user mark individual tasks as ‘resolved’

After completing the second task, your project should now be able to display a list of all user’s tasks. Add a button to each task, possibly with a checkmark, that will mark that task as resolved.

