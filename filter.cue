package structural

Filter :: {
	F: _
	In: _
	Result: [ v for v in In if ({ In: v } & F) != _|_ ]
}
