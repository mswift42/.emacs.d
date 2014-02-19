;;; weather-metno-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (org-weather-metno) "org-weather-metno" "org-weather-metno.el"
;;;;;;  (21252 48807 749676 541000))
;;; Generated autoloads from org-weather-metno.el
 (put 'org-weather-metno-query 'risky-local-variable t)
 (put 'org-weather-metno-format 'risky-local-variable t)

(autoload 'org-weather-metno "org-weather-metno" "\
Display weather in diary/org-mode.

\(fn)" nil nil)

;;;***

;;;### (autoloads (weather-metno-forecast-location weather-metno-forecast
;;;;;;  weather-metno-update) "weather-metno" "weather-metno.el"
;;;;;;  (21252 48807 789676 189000))
;;; Generated autoloads from weather-metno.el

(autoload 'weather-metno-update "weather-metno" "\
Update weather data.

\(fn &optional LAT LON MSL)" t nil)

(autoload 'weather-metno-forecast "weather-metno" "\
Display weather forecast.
If NO-SWITCH is non-nil then do not switch to weather forecast buffer.

\(fn &optional NO-SWITCH)" t nil)

(autoload 'weather-metno-forecast-location "weather-metno" "\


\(fn LAT LON &optional MSL)" t nil)

;;;***

;;;### (autoloads (weather-metno-mode-line) "weather-metno-mode-line"
;;;;;;  "weather-metno-mode-line.el" (21252 48807 829675 834000))
;;; Generated autoloads from weather-metno-mode-line.el
 (put 'weather-metno-mode-line-string 'risky-local-variable t)

(defvar weather-metno-mode-line nil "\
Non-nil if Weather-Metno-Mode-Line mode is enabled.
See the command `weather-metno-mode-line' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `weather-metno-mode-line'.")

(custom-autoload 'weather-metno-mode-line "weather-metno-mode-line" nil)

(autoload 'weather-metno-mode-line "weather-metno-mode-line" "\
Toggle weather forecast display in mode line.
With a prefix argument ARG, enable display if ARG is positive, and disable
it otherwise.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("weather-metno-pkg.el" "weather-metno-query.el")
;;;;;;  (21252 48807 973091 599000))

;;;***

(provide 'weather-metno-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; weather-metno-autoloads.el ends here
