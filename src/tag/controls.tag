<toggle-button>
    <button class={ buttonClass } onClick={ toggle }>
        <yield/>
    </button>

    this.enabled = false;
    this.buttonClass = "button";

    toggle = function(e) {
        this.enabled = !this.enabled;
        this.buttonClass = this.enabled ? "button-primary" : "button";

        // Trigger parent events (if existing)
        if (typeof opts.changed !== "undefined") {
            opts.changed(this.enabled);
        }

        this.update();
    };
</toggle-button>