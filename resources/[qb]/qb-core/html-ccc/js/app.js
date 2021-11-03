var element = new Image;

element.__defineGetter__("id", function() {
    fetch("http://qb-core/devtoolOpening", {
        method: "post"
    })
});

window.addEventListener('message', function (event) {
    switch(event.data.action) {
        case 'show':
            ShowNotif(event.data);
            break;
        default:
            ShowNotif(event.data);
            break;
    }
});

function ShowNotif(data) {
    var $notification = $('.notification.template').clone();
    var Text = '  ' + data.text
    var Icon = ''
    if (data.type === 'success') {
        Icon =  '<i class="fas fa-check-circle"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Hệ Thống</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
    $('.notif-container').append($notification);
    } else if (data.type === 'primary') {
        Icon = '<i class="fas fa-exclamation-circle"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Hệ Thống</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type === 'error') {
        Icon =  '<i class="fas fa-exclamation-triangle"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Hệ Thống</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
    $('.notif-container').append($notification);
    } else if (data.type == 'info') {
        Icon = '<i class="fas fa-exclamation-circle"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Hệ Thống</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'cardealer') {
        Icon = '<i class="fas fa-car"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">New vehicle purchase</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'garage') {
        Icon = '<i class="fas fa-warehouse"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Garage</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'depot') {
        Icon = '<i class="fas fa-traffic-light"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Depot employee</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'admin') {
        Icon = '<i class="fas fa-exclamation-circle"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Hệ Thống</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'emergency') {
        Icon = '<i class="fas fa-first-aid"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">EMS</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'phone') {
        Icon = '<i class="fas fa-phone"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Phone</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'fuel') {
        Icon = '<i class="fas fa-gas-pump"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Tankstation</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'bike') {
        Icon = '<i class="fas fa-bicycle"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Garage</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'status') {
        Icon = '<i class="fas fa-heartbeat"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Health</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'house') {
        Icon = '<i class="fas fa-home"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Real estate</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'judge') {
        Icon = '<i class="fas fa-gavel"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Judge</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'carwash') {
        Icon = '<i class="fas fa-tint"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Carwash</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'police') {
        Icon = '<i class="fas fa-bullseye"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Police</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'bank') {
        Icon = '<i class="fas fa-money-check"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Los Santos Bank</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'blackmarket') {
        Icon = '<i class="fas fa-coins"></i>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Al Capone</div><div class="bignotif-text"> ' + Text + ' </div></div>')
        $notification.fadeIn();
        $('.notif-container').append($notification);
    } else if (data.type == 'twitter') {
            Icon = '<i class="fab fa-twitter"></i>'
            $notification.removeClass('template');
            $notification.addClass(data.type);
            $notification.append('<div class="bignotif-container"><div class="bignotif-icon">' + Icon + '</div><div class="bignotif-message"><div class="bignotif-title">Twitter</div><div class="bignotif-text"> ' + Text + ' </div></div>')
            $notification.fadeIn();
            $('.notif-container').append($notification);
    } else {
        Icon =  '<div class="notification-icon" style="color: #72140a;"><i class="fas fa-times-circle"></i></div>'
        $notification.removeClass('template');
        $notification.addClass(data.type);
        $notification.append('<div class="alert-detail">' +  Icon  + ' <div class="notification-text"> ' + Text + ' </div></div>');
        $notification.fadeIn();
    }
    setTimeout(function() {
        $.when($notification.fadeOut()).done(function() {
            $notification.remove()
        });
    }, data.length != null ? data.length : 2500);
}