extension String {
    func isCapitalized() -> Bool {
        self.first?.isUppercase ?? false
    }
    
    func endsWithPeriod() -> Bool {
        self.last == "."
    }
}
