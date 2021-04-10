# README

This application represents virtual Tech meetup site where users can create meetup and other users can join. 
Allows not logged in users to see meetups, to search for meetups, see upcoming events and most popular events. 
Allows logged in users to create meetups, join meetups and post comments. 
Conveniently weather will be displayed on the navbar based on user's location.

## Getting Started

To get started with the app, clone the repo and then install the needed gems:


`cd techmeetup`

`bundle install`

Next, migrate the database:

`rake db:migrate`

Next, seed the database:

`rake db:seed`

Then run the app in a local server:

`rails server`

## Functionalities

- **Sign up** : App doesnt require signup in order to see and search meetups, upcoming and popular events, see comments;

- **Login** :  Logged in user can create meetup, attend meetup and post comments on meetups

- **Create meetup** : Logged in users can create meetup, set date and time and add description about the nature of the meetup

- **Attend meetup** : Welcome email, 24hours email reminder, 1hour email reminder

- **Search meetup** : By title

- **Post comments** : Users can discuss and make suggestion about meetup

- **Weather** : Showing weather of user's current location

- **Geolocation API** :  Using Geolocation API to get user location from browser

- **OpenWeather API** : Using OpenWeather API to get the weather based on Geolocation
Location. Location Services on MacOS for Chrome browser are buggy, issue was resolved by using the latest Chrome browser update.
Tested with Chrome Version 89.0.4389.114 (Official Build) (x86_64) on MacOS.

- **Upcoming events** : Events listed in desc order by date and showing the top three

- **Popular events** : Events listed in desc order by number of attendees and showing the top three

### Use Cases

**Usecase1**: User is not logged in, can see all meetups with  details, all comments, upcoming and popular events, perform search, but can't create  meetup, nor attend meetup, nor post comment

**Usecase2**: Logged in user can create meetup,attend meetup and post comments. 
Execution: Attend meetup, now run rails console and type `Delayed::job.count` you should see 3 jobs. The First job is Welcome email, the next two are scheduled emails 24hours and 1hour remider. Now run delayed_job from terminal with `rake jobs:work`
Open another browser tap, go to  https://mailtrap.io/signin, you should see 1 email, welcome email sent. Go back to the terminal and run `Delayed::job.count` again, it will return 2. These are the scheduled reminder emails.

**Usecase3**: User attends to meetup, welcome email is sent, 24hours reminder email sent, 1hour reminder email sent.


### Verifying sent emails (Mailtrap)

https://mailtrap.io/signin

After user signs up for an event, emails can be seen in mailtrap

### Queues (Delayed_Job)

For email reminder Delayed_job gem is used.
For email on DEV environment mailtrap.io is used as SMTP and it catches all emails sent by meetup application.
Emails and created and sent to delayed job. In order to send an email Delayed_job worker needs to run:
`rake jobs:clear` (it will clear the queue - delete all records in the queue without execution)
`rake jobs:work` (it will start worker and worker will start executing jobs(sending welcome and reminder emails) according to scheduled time)

## Contributing

Bug reports and pull requests are welcome on GitHub.

## License

All source code is available under the MIT License.
