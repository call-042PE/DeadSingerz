import { Application } from "@hotwired/stimulus"
import AnimatedNumber from "stimulus-animated-number"

const application = Application.start()
application.register("animated-number", AnimatedNumber)
