function checkNumber(event) {
    if(event.key >= 0 && event.key <= 9) {
        return true;
    }

    return false;
}