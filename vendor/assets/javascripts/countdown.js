/**
 * Varkala - Bootstrap 4 E-commerce Theme v. 1.2.0
 * Homepage: https://themes.getbootstrap.com/product/varkala-e-commerce-theme/
 * Copyright 2020, Bootstrapious - https://bootstrapious.com
 */

'use strict';

// ------------------------------------------------------- //
//   JavaScript Countdown
// ------------------------------------------------------ //    

function Countdown(id, deadline) {

    this.deadline = deadline;
    this.id = id;

    var self = this;

    self.clock = document.getElementById(self.id);

    if (self.clock !== null) {
        self.daysSpan = self.clock.querySelector('.days');
        self.hoursSpan = self.clock.querySelector('.hours');
        self.minutesSpan = self.clock.querySelector('.minutes');
        self.secondsSpan = self.clock.querySelector('.seconds');

        updateClock();
        var timeinterval = setInterval(updateClock, 1000);
    }

    function updateClock() {
        var t = getTimeRemaining(self.deadline);

        self.daysSpan.innerHTML = t.days;
        self.hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
        self.minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
        self.secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

        if (t.total <= 0) {
            clearInterval(timeinterval);
        }
    }

    function getTimeRemaining(endtime) {
        var t = Date.parse(endtime) - Date.parse(new Date());
        var seconds = Math.floor((t / 1000) % 60);
        var minutes = Math.floor((t / 1000 / 60) % 60);
        var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
        var days = Math.floor(t / (1000 * 60 * 60 * 24));
        return {
            'total': t,
            'days': days,
            'hours': hours,
            'minutes': minutes,
            'seconds': seconds
        };
    }
}