package main

import (
	hc "cirello.io/HumorChecker"
	"github.com/sirupsen/logrus"
	prefixed "github.com/x-cray/logrus-prefixed-formatter"
)

var log = logrus.New()

func init() {
	formatter := new(prefixed.TextFormatter)
	formatter.FullTimestamp = true
	formatter.ForceColors = true
	// Set specific colors for prefix and timestamp
	formatter.SetColorScheme(&prefixed.ColorScheme{
		PrefixStyle:    "blue+b",
		TimestampStyle: "white+h",
	})

	log.Formatter = formatter
	log.Level = logrus.DebugLevel
}

func main() {
	log.Info(hc.Analyze("ey you worthless scumbag"))
	log.Info(hc.Positivity("This is so cool"))
	log.Info(hc.Negativity("Hey you worthless scumbag"))
	log.Info(hc.Analyze("I am happy"))
	log.Info(hc.Analyze("I am so happy"))
	log.Info(hc.Analyze("I am extremely happy"))
	log.Info(hc.Analyze("I am really sad"))
}
