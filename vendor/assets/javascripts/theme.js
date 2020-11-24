/**
 * Varkala - Bootstrap 4 E-commerce Theme v. 1.2.0
 * Homepage: https://themes.getbootstrap.com/product/varkala-e-commerce-theme/
 * Copyright 2020, Bootstrapious - https://bootstrapious.com
 */

'use strict';

$(function () {

    AOS.init({
        disable: detectIE(), // dont' run in IEs as it's really slow
        startEvent: 'DOMContentLoaded', // name of the event dispatched on the document, that AOS should initialize on
        offset: 120, // offset (in px) from the original trigger point
        delay: 150, // values from 0 to 3000, with step 50ms
        duration: 400, // values from 0 to 3000, with step 50ms
        easing: 'ease', // default easing for AOS animations
        once: true, // whether animation should happen only once - while scrolling down
    });

    // ------------------------------------------------------- //
    //   Increase/Decrease product amount
    // ------------------------------------------------------ //

    $('.btn-items-decrease').on('click', function () {
        var input = $(this).siblings('.input-items');
        if (parseInt(input.val(), 10) >= 1) {
            input.val(parseInt(input.val(), 10) - 1);
        }
    });

    $('.btn-items-increase').on('click', function () {
        var input = $(this).siblings('.input-items');
        input.val(parseInt(input.val(), 10) + 1);
    });


    // ------------------------------------------------------- //
    //   Vh hack for sidebars on mobiles
    // ------------------------------------------------------ //


    function setVhVar() {
        var vh = window.innerHeight * 0.01;
        // Then we set the value in the --vh custom property to the root of the document
        document.documentElement.style.setProperty('--vh', vh + 'px');
    }


    setVhVar();
    

    // We listen to the resize event
    window.addEventListener("resize", setVhVar);

    // ------------------------------------------------------- //
    //   Transparent navbar dropdowns 
    //
    //   = do not make navbar 
    //   transparent if dropdown's still open 
    //   / make transparent again when dropdown's closed
    // ------------------------------------------------------ //

    var navbar = $('.navbar'),
        navbarCollapse = $('.navbar-collapse');

    $('.navbar.bg-transparent .navbar-collapse').on('show.bs.collapse', function () {
        makeNavbarWhite();
    });


    $('.navbar.bg-transparent .navbar-collapse').on('hidden.bs.collapse', function () {
        makeNavbarTransparent();
    });

    function makeNavbarWhite() {
        navbar.addClass('was-transparent');
        if (navbar.hasClass('navbar-dark')) {
            navbar.addClass('was-navbar-dark');
            navbar.removeClass('navbar-dark');
        } else {
            navbar.addClass('was-navbar-light');
        }

        navbar.removeClass('bg-transparent');

        navbar.addClass('bg-white');
        navbar.addClass('navbar-light');
    }

    function makeNavbarTransparent() {
        navbar.removeClass('bg-white');
        navbar.removeClass('navbar-light');
        navbar.removeClass('was-transparent');

        navbar.addClass('bg-transparent');
        if (navbar.hasClass('was-navbar-dark')) {
            navbar.addClass('navbar-dark');
        } else {
            navbar.addClass('navbar-light');
        }

    }

    // ------------------------------------------------------- //
    //   Bootstrap tooltips
    // ------------------------------------------------------- //

    $('[data-toggle="tooltip"]').tooltip();


    // ------------------------------------------------------- //
    //    Colour form control 
    // ------------------------------------------------------ //

    $('.btn-colour').on('click', function (e) {
        var button = $(this);

        if (button.attr('data-allow-multiple') === undefined) {
            button.parents('.colours-wrapper').find('.btn-colour').removeClass('active');
        }

        button.toggleClass('active');
    });

    // ------------------------------------------------------- //
    //  Button-style form labels used in product details
    // ------------------------------------------------------ //

    $('.detail-option-btn-label').on('click', function () {
        var button = $(this);

        button.parents('.detail-option').find('.detail-option-btn-label').removeClass('active');

        button.toggleClass('active');
    });


    // ------------------------------------------------------- //
    //   Image zoom
    // ------------------------------------------------------ //

    $('[data-toggle="zoom"]').each(function () {
        $(this).zoom({
            url: $(this).attr('data-image'),
            duration: 0
        });
    });

    // ------------------------------------------------------- //
    //   Smooth Scroll
    // ------------------------------------------------------- //

    var smoothScroll = new SmoothScroll('a[data-smooth-scroll]');

    // ------------------------------------------------------- //
    //   Object Fit Images
    // ------------------------------------------------------- //    

    objectFitImages();


    // ------------------------------------------------------- //
    // Adding fade+animation effect to dropdowns in navbar  
    // and topbar
    // ------------------------------------------------------ //

    $.fn.adjustNavbarDropdowns = function () {
        $('.navbar .dropdown-menu, .top-bar .dropdown-menu').each(function () {

            var translateY = 'translateY(30px)',
                translateX = '',
                dropdownMenu = $(this),
                windowOuterWidth = $(window).outerWidth();

            if (dropdownMenu.attr('data-translate-x') && windowOuterWidth >= options.navbarExpandPx) {
                translateX = 'translateX(' + dropdownMenu.attr('data-translate-x') + ')'
            }
            if (dropdownMenu.hasClass('show')) {
                translateY = 'translateY(0)'
            }

            dropdownMenu.css('transform', translateX + ' ' + translateY);

            if (dropdownMenu.attr('data-min-width') && windowOuterWidth > options.navbarExpandPx) {
                dropdownMenu.css('min-width', dropdownMenu.attr('data-min-width'));
            } else if (dropdownMenu.attr('data-min-width') && windowOuterWidth <= options.navbarExpandPx) {
                dropdownMenu.css('min-width', 'auto');
            }

        });
    }

    $.fn.adjustNavbarDropdowns();

    $.fn.slideDropdownUp = function () {
        var translateY = 'translateY(0)',
            translateX = '',
            dropdownMenu = $(this),
            windowOuterWidth = $(window).outerWidth();

        if (dropdownMenu.attr('data-translate-x') && windowOuterWidth > options.navbarExpandPx) {
            translateX = 'translateX(' + dropdownMenu.attr('data-translate-x') + ')'
        }
        dropdownMenu.fadeIn().css('transform', translateX + ' ' + translateY);

        return this;
    };
    $.fn.slideDropdownDown = function (movementAnimation) {

        var translateY = 'translateY(30px)',
            translateX = '',
            dropdownMenu = $(this),
            windowOuterWidth = $(window).outerWidth();


        if (dropdownMenu.attr('data-translate-x') && windowOuterWidth > options.navbarExpandPx) {
            translateX = 'translateX(' + dropdownMenu.attr('data-translate-x') + ')'
        }
        if (movementAnimation) {
            if (windowOuterWidth > options.navbarExpandPx) {
                dropdownMenu.fadeOut().css('transform', translateX + ' ' + translateY);
            } else {
                dropdownMenu.fadeOut(150).css('transform', translateX + ' ' + translateY);
            }

        } else {
            dropdownMenu.hide().css('transform', translate);
        }
        return this;
    };

    $('.navbar .dropdown, .top-bar .dropdown').on('show.bs.dropdown', function (e) {
        $(this).find('.dropdown-menu').first().slideDropdownUp();
    });

    $('.navbar .dropdown, .top-bar .dropdown').on('hide.bs.dropdown', function (e) {

        var movementAnimation = true;

        // if navigation to another page
        if (e.clickEvent && e.clickEvent.target.tagName.toLowerCase() === 'a') {
            movementAnimation = false;
        }

        $(this).find('.dropdown-menu').first().slideDropdownDown(movementAnimation);
    });

});

$(window).on('resize', function () {
    $.fn.adjustNavbarDropdowns();
});


function detectIE() {
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf('MSIE ');
    var version = false;

    if (msie > 0) {
        // IE 10 or older => return version number
        version = parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
    }

    var trident = ua.indexOf('Trident/');
    if (trident > 0) {
        // IE 11 => return version number
        var rv = ua.indexOf('rv:');
        version = parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
    }

    var edge = ua.indexOf('Edge/');
    if (edge > 0) {
        // Edge (IE 12+) => return version number
        version = parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
    }

    if (version !== false && version <= 11) {
        return true;
    } else {
        return false;
    }

}