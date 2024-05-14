extends Node

#region Words

var default_words:Array[String] = [
	"APPLE", "LEMON", "GRAPE", "MELON", "BANANA",  # 5-letter words
	"ORANGE", "PEACH", "CARROT", "POTATO", "TOMATO",  # 6-letter words
	"AVOCADO", "LETTUCE", "SPINACH", "BROCCOLI", "CABBAGE",  # 7-letter words
	"COFFEE", "JUICE", "MUFFIN", "COOKIE", "DONUT",  # 5-letter words
	"CHEESE", "BUTTER", "YOGURT", "BREAD", "SALAD",  # 6-letter words
	"SANDWICH", "PANCAKE", "WAFFLE", "SAUSAGE", "BACON",  # 7-letter words
	"PENCIL", "MARKER", "PAPER", "BOOKS", "CHALK",  # 5-letter words
	"CRAYON", "GLUE", "RULER", "ERASER", "PAINT",  # 6-letter words
	"SCISSORS", "BACKPACK", "NOTEBOOK", "DESKTOP", "TABLET",  # 7-letter words
	"BASKET", "SOCCER", "TENNIS", "GOLF", "HOCKEY",  # 5-letter words
	"FOOTBALL", "CRICKET", "BOWLING", "SWIMMING", "RUNNING",  # 7-letter words
]

var easy_words1:Array[String] = [ # Easy General Words
	"CAT", "DOG", "BAT", "RAT", "MAT", "HAT", "FAT", "PAT", "SAT", "RAT",
	"TAR", "BAR", "CAR", "FAR", "MAR", "JAR", "PAR", "WAR", "CAP", "TAP",
	"NAP", "LAP", "SAP", "GAP", "MAP", "ZAP", "RAP", "YAP", "LAP", "LIP",
	"TIP", "DIP", "RIP", "HIP", "SIP", "PIP", "NIP", "DIP", "ZIP", "TOP",
	"HOP", "MOP", "COP", "POP", "SOP", "LOP", "WOP", "BOP", "YIP", "JOT",
	"HOT", "POT", "ROT", "GOT", "LOT", "NOT", "COT", "DOT", "TOT", "JOT",
	"HUT", "BUT", "CUT", "NUT", "GUT", "RUT", "HUT", "PUT", "TUT", "HUT",
	"RUT", "PUT", "TUG", "MUG", "HUG", "JUG", "LUG", "DUG", "RUG", "BUG",
	"TUG", "HUG", "JUG", "LUG", "DUG", "RUG", "BUG", "MUG", "HUG", "TUG",
	"JUG", "LUG", "DUG", "RUG", "BUG", "MUG", "HUG", "TUG", "JUG", "LUG"]

var easy_words2:Array[String] = [ # Easy Animals
	"FOX", "COW", "HEN", "PIG", "OWL", "BEE", "ANT", "FLY", "CAT", "DOG",
	"BAT", "RAT", "COD", "ELK", "EMU", "EEL", "GNU", "HOG", "JAY", "APE",
	"BOA", "RAM", "EWE", "YAK", "GIR"]

var four_letter_foods:Array[String] = ["RICE", "FISH", "CAKE", "BEEF", "SOUP", "YAM", "PEAR", "MEAT", "CORN",
	"BUN", "SPIN", "WRAP", "CHIP", "ROLL", "MINT", "TOFU", "SPAM"]

var hard_to_spell_foods:Array[String] = [
	"QUINOA", "GNOCCHI", "COUSCOUS", "BRUSCHETTA", "HUMMUS", "GUACAMOLE", "RATATOUILLE", "TABBOULEH", "SAUERKRAUT",
	"BOUILLABAISSE", "CEVICHE", "QUESADILLA", "FRITTATA", "PAELLA", "SASHIMI", "TZATZIKI", "BIBIMBAP", "SCHNITZEL", "SOUFFLE", "BABA GHANOUSH",
	"ESCARGOT", "EDAMAME", "CACCIATORE", "KOMBUCHA", "BORSHCHT", "POUTINE", "GYRO", "CAPRESE", "MOZZARELLA", "WASABI"]

var military_terms:Array[String] = [
	"FALCON", "HORNET", "PROWLER", "WARTHOG", "EAGLE", "HUMVEE", "TOMCAT", "MIG", "NAVY", "ARMY",
	"MARINES", "SPIRIT", "STINGER", "CARRIER", "OSPREY", "CRUISER", "COPTER", "CORSAIR", "ABRAHMS", "HELLCAT",
	"PALADIN", "BRADLEY", "AVENGER", "CHINOOK", "APACHE", "BOMBER", "RECON", "RANGER", "SEAL"]

var acronyms:Array[String] = [
	"NASA", "CPS", "DOT", "GPS", "GNP", "GDP", "POW", "MIA", "ASAP", "VIP",
	"RSVP", "RMA", "TPS", "LOL", "ROTFL", "LMAO", "GOP", "IMF", "USA", "NAACP",
	"MADD", "TNT", "BYOB", "DSL"]

var bird_names:Array[String] = [
	"SWALLOW", "CANARY", "FINCH", "ROBIN", "EMU", "OSTRICH", "HAWK", "EAGLE", "FALCON", "PENGUIN",
	"PUFFIN", "DODO", "PIGEON", "SPARROW", "TUCAN", "CHICKEN", "ROOSTER", "PARROT", "CONDOR", "VULTURE",
	"KIWI", "GROUSE", "PELICAN", "IBIS", "DUCK", "SWAN", "GOOSE", "POCHARD", "KESTREL", "QUAIL",
	"SEAGULL", "CUCKOO", "OWL", "LARK", "WREN", "RAVEN", "CROW", "ORIOLE", "THRUSH"]

var musical_instruments:Array[String] = [
	"PIANO", "FLUTE", "GUITAR", "VIOLIN", "BANJO", "OBOE", "BASS", "SAX", "PICCOLO", "HARP",
	"GONG", "DRUM", "CYMBAL", "HORN", "TRUMPET", "KAZOO", "CELLO", "TUBA", "BONGO", "UKULELE",
	"SITAR", "ORGAN"]

var colors:Array[String] = [
	"TEAL", "BLACK", "RED", "ORANGE", "GREEN", "BLUE", "PURPLE", "OLIVE", "VIOLET", "INDIGO",
	"MAUVE", "CARAMEL", "UMBER", "SIENNA", "MAROON", "CRIMSON", "BEIGE", "TAN", "AZURE", "CYAN",
	"YELLOW", "MAGENTA", "KHAKI", "BROWN", "WHITE", "GREY", "SILVER", "GOLD", "COPPER", "HAZEL"]

var math_terms:Array[String] = [
	"ANGLE", "TRIG", "SINE", "COSINE", "TANGENT", "SECANT", "RADIAN", "DEGREE", "FACTOR", "DIVISOR",
	"DERIVE", "INTEGER", "LIMIT", "GRAPH", "LOGIC", "SERIES", "ROOT", "RANDOM", "VECTOR", "RADIUS",
	"ARC", "ARCTAN"]

var programming_languages:Array[String] = [
	"JAVA", "CPP", "CSHARP", "ALGOL", "ADA", "BASIC", "FORTRAN", "LISP", "PERL", "PASCAL", "GDSCRIPT",
	"PYTHON", "COBOL", "COCOA", "EIFFEL", "FORTH", "OBERON", "PHP", "RUBY", "SCHEME", "LOGO", "HTML"]

var metric_prefixes:Array[String] = [
	"NANO", "MICRO", "PICO", "MILLI", "CENTI", "DECI", "KILO", "MEGA", "GIGA", "YOTTA",
	"ZETTA", "EXA", "PETA", "TERA", "HECTO", "DEKA", "FEMTO", "ATTO", "ZEPTO", "YOCTO"]

var computer_terms:Array[String] = [
	"RAM", "DISK", "FLOPPY", "CPU", "MODEM", "NETWORK", "CLUSTER", "CDROM", "DVD", "MEMORY",
	"DEFRAG", "BIOS", "MOUSE", "MONITOR", "PRINTER", "USB", "PORT", "REBOOT", "CRASH", "FREEBSD",
	"LINUX", "GPL", "KERNEL", "SIGHUP"]

var rhymes1:Array[String] = [
	"FAT", "BAT", "CAT", "RAT", "SPLAT", "MAT", "BRAT", "FLAT", "SPAT", "CHAT", "DRAT", "FRAT", "GNAT",
	"HAT", "DAT", "LAT"]

var rhymes2:Array[String] = [
	"AWAY", "BRAY", "BAY", "CLAY", "DAY", "GRAY", "HAY", "LAY", "MAY", "PAYDAY", "SLEIGH", "PLAY", "RAY",
	"SAY", "SPRAY", "STAY", "SWAY", "OKAY", "TRAY", "NAY", "WAY", "HEY", "STRAY"]

var rhymes3:Array[String] = [
	"BRING", "CLING", "FLING", "KING", "PING", "RING", "SING", "SLING", "SPRING", "STING", "STRING", "SWING",
	"SLING", "THING", "WING", "ZING", "DING", "SCHWING", "SINKING", "WINKING", "LINKING", "INKLING"]

var rhymes4:Array[String] = [
	"BRIGHT", "DELIGHT", "FIGHT", "FLIGHT", "FRIGHT", "LIGHT", "MIGHT", "NIGHT", "RIGHT", "SIGHT", "SLIGHT",
	"TIGHT", "TONIGHT"]

var rhymes5:Array[String] = [
	"BOW", "BLOW", "HOHO", "CROW", "FLOW", "GLOW", "GROW", "LOW", "MOW", "ROW", "SHOW", "SLOW", "GOGO", "SNOW",
	"DOH", "DOUGH", "THOUGH", "SOW", "OHNO!", "STOW", "THROW", "TOW"]

var rhymes6:Array[String] = [
	"ATTACK", "BACK", "BLACK", "CRACK", "JACK", "KNACK", "LACK", "PACK", "QUACK", "RACK", "SACK", "SNACK",
	"STACK", "TACK", "TRACK", "WHACK", "SHAQ", "WACK"]

var elements_1:Array[String] = [
	"ARGON", "ARSENIC", "BARIUM", "BISMUTH", "BORON", "BROMINE", "CADMIUM", "CALCIUM", "CARBON", "CERIUM",
	"COBALT", "COPPER", "CURIUM", "GALLIUM", "GOLD", "HELIUM", "INDIUM", "IODINE", "IRIDIUM", "IRON"]

var elements_2:Array[String] = [
	"KRYPTON", "LEAD", "LITHIUM", "MERCURY", "NEON", "NICKEL", "OSMIUM", "OXYGEN", "RADIUM", "RADON",
	"SILICON", "SILVER", "SODIUM", "SULFUR", "TIN", "URANIUM", "WOLFRAM", "XENON", "YTTRIUM", "ZINC"]

var units_of_measurement:Array[String] = [
	"INCH", "FOOT", "YARD", "ROD", "MILE", "ACRE", "OUNCE", "PINT", "QUART", "GALLON",
	"BARREL", "PECK", "BUSHEL", "GRAIN", "DRAM", "POUND", "TON", "OUNCE", "SCRUPLE", "LENGTH"]

var physical_quantities:Array[String] = [
	"FORCE", "MASS", "POWER", "VOLTAGE", "FLUX", "LUMEN", "NEWTON", "HERTZ", "LUX", "METE",
	"WEBER", "TESLA", "AMPERE", "WATT", "VOLT", "HENRY"]

var letters:Array[String] = [
	"A", "B", "C", "D", "E", "F", "G", "H", "I", 
	"J", "K", "L", "M", "N", "O", "P", "Q", "R", 
	"S", "T", "U", "V", "W", "X", "Y", "Z"]
#endregion

var words:Array[String] = []
var last_rng:int = -1

func get_word():
	var rng:int
	
	if words.size() == 0: # Null safeguard
		words = default_words.duplicate()
	
		if GameManager.difficulty == GameManager.Difficulty.EASY:
			while rng == last_rng: rng = randi_range(0, 3)
			if rng == 0: words = easy_words1.duplicate()
			if rng == 1: words = rhymes1.duplicate()
			if rng == 2: words = easy_words2.duplicate()
			if rng == 3: words = four_letter_foods.duplicate()
		if GameManager.difficulty == GameManager.Difficulty.NORMAL:
			while rng == last_rng: rng = randi_range(0, 3)
			if rng == 0: words = acronyms.duplicate() 
			if rng == 1: words = rhymes2.duplicate()
			if rng == 2: words = programming_languages.duplicate()
			if rng == 3: words = metric_prefixes.duplicate()
		if GameManager.difficulty == GameManager.Difficulty.HARD:
			while rng == last_rng: rng = randi_range(0, 3)
			if rng == 0: words = units_of_measurement.duplicate()
			if rng == 1: words = computer_terms.duplicate()
			if rng == 2: words = rhymes4.duplicate()
			if rng == 3: words = colors.duplicate()
		if GameManager.difficulty == GameManager.Difficulty.EXPERT:
			while rng == last_rng: rng = randi_range(0, 3)
			if rng == 0: words = physical_quantities.duplicate()
			if rng == 1: words = math_terms.duplicate()
			if rng == 2: words = bird_names.duplicate()
			if rng == 3: words = military_terms.duplicate()
		if GameManager.difficulty == GameManager.Difficulty.XTREME:
			while rng == last_rng: rng = randi_range(0, 3)
			if rng == 0: words = elements_2.duplicate()
			if rng == 1: words = rhymes3.duplicate()
			if rng == 2: words = elements_1.duplicate()
			if rng == 3: words = hard_to_spell_foods.duplicate()
		
		last_rng = rng


	var word = words.pick_random() # Pick random word
	words.erase(word) # Prevent duplicate words
	
	return word


func get_letter():
	return letters.pick_random()
