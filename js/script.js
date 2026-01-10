(function ($) {
    "use strict";
      $('.sakura-falling').sakura();

    // Personalization logic
    function getQueryParams() {
        const params = {};
        const queryString = window.location.search.substring(1);
        if (queryString) {
            const pairs = queryString.split("&");
            for (let i = 0; i < pairs.length; i++) {
                const pair = pairs[i].split("=");
                params[decodeURIComponent(pair[0])] = decodeURIComponent(pair[1] || "");
            }
        }
        return params;
    }

    const params = getQueryParams();
    const guestName = params['n'] || params['name'];

    if (guestName) {
        const guestGreeting = document.getElementById('guest-greeting');
        if (guestGreeting) {
            guestGreeting.innerText = `Hi ${guestName},`;
            guestGreeting.style.display = 'block';
            
            // Adjust the subsequent message
            const joyMessage = document.getElementById('joy-message');
            if (joyMessage) joyMessage.innerText = "With hearts full of joy, we";
        }

        // Extract first name for RSVP and Meta
        const firstName = guestName.split(' ')[0];

        // Update RSVP link
        const rsvpLink = document.getElementById('rsvp-link');
        if (rsvpLink) {
            const encodedFirstName = encodeURIComponent(firstName);
            const rsvpText = `Hi Sandeep, I (${firstName}) will be attending the wedding!`;
            rsvpLink.href = `https://wa.me/917983873235?text=${encodeURIComponent(rsvpText)}`;
        }

        // Update Meta tags and Title for link preview
        document.title = `Hi ${firstName}! You're invited to Anudeep's Wedding`;
        
        const metaTitle = document.querySelector('meta[property="og:title"]');
        if (metaTitle) metaTitle.setAttribute('content', `Hi ${firstName}! You're invited to Anudeep's Wedding`);

        const twitterTitle = document.querySelector('meta[name="twitter:title"]');
        if (twitterTitle) twitterTitle.setAttribute('content', `Hi ${firstName}! You're invited to Anudeep's Wedding`);
    }

})(jQuery);


$(document).on('click', function(){
    document.getElementById("my_audio").play();
    console.log('Shaadi me zaroor aana');
});

// Set the date we're counting down to
var countDownDate = new Date("March 9, 2026 19:00:00").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

    // Get todays date and time
    var now = new Date().getTime();
    
    // Find the distance between now and the count down date
    var distance = countDownDate - now;
    
    // Time calculations for days, hours, minutes and seconds
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    
    // Output the result in an element with id="demo"
    document.getElementById("time").innerHTML = "<div class='container'><div class='days block'>"+ days + "<br>Days</div>" + "<div class='hours block'>" + hours + "<br>Hours</div>" + "<div class='minutes block'>" + minutes + "<br>Minutes</div>" + "<div class='seconds block'>" + seconds + "<br>Seconds</div></div>";
    
    // If the count down is over, write some text 
    if (distance < 0) {
        clearInterval(x);
        document.getElementById("countdown-message").style.display = "none";
        document.getElementById("time").innerHTML = "Bless the married couple for happy life!";
    }
}, 1000);

console.log('Join us in our happiness!');
