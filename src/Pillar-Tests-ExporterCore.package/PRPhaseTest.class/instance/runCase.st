running
runCase
	"I'm here because PRPhaseTest will create a Mock and we don't want to inform Nautilus."

	SystemAnnouncer uniqueInstance suspendAllWhile: [ super runCase ]