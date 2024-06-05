.pragma library
.import "./constants.js" as CONSTANTS

// private
/**
 * rgb String - '#ffddeee'
 */
function luminance(rgb) {
    let
        r = parseInt(rgb.slice(1, 3), 16),
        g = parseInt(rgb.slice(3, 5), 16),
        b = parseInt(rgb.slice(5, 7), 16),
        a = [r, g, b].map(function (v) {
            v /= 255
            return v <= 0.03928
            ? v / 12.92
            : Math.pow( (v + 0.055) / 1.055, 2.4 )
        })
    return a[0] * 0.2126 + a[1] * 0.7152 + a[2] * 0.0722
}

function setMainColour(newColour, api) {
    api.memory.set(CONSTANTS.MAIN_COLOUR, newColour)
}
// public

/**
 * Get current Main colour, alwais return a #number patern
 * if mainColour was not previouslly set, then set a defaul colour
 *
 */
const getMainColour = function(api) {
    let mainColour  = api.memory.get(CONSTANTS.MAIN_COLOUR)
    if(!mainColour){
        mainColour = CONSTANTS.DEFAULT_MAIN_COLOUR
        setMainColour(mainColour, api)
    }
    if(mainColour[0] != '#') mainColour = CONSTANTS[mainColour] || mainColour
    return mainColour
}

/**
 * Get foreground colour based on luminanace of Main colour
 *
 */
const getForegroundColour = function(api) {
    let mainColour  = getMainColour(api)
    if(luminance(mainColour) < 0.5){
        return CONSTANTS.FOREGROUND_LIGHT
    } else return CONSTANTS.FOREGROUND_DARK
}

/**
 * Get background colour based on luminanace of Main colour
 *
 */
const getForegroundGrey = function(api) {
    let mainColour  = getMainColour(api)
    if(luminance(mainColour) < 0.5){
        return CONSTANTS.BACKGROUND_LIGHT
    } else return CONSTANTS.BACKGROUND_DARK
}
/**
 * Get background colour based on luminanace of Main colour
 *
 */
const getBackgroundColour = function(api) {
    let mainColour  = getMainColour(api)
    if(luminance(mainColour) < 0.5){
        return CONSTANTS.BACKGROUND_DARK
    } else return CONSTANTS.BACKGROUND_LIGHT
}
