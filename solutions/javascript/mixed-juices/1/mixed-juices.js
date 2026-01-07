// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  console.log(name)
  switch (name){
    case 'Pure Strawberry Joy':
      return 0.5
    case 'Energizer':
    case  'Green Garden':
      return 1.5
    case 'Tropical Island':
      return 3
    case 'All or Nothing':
      return 5
    default:
      return 2.5
  }
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  let x = wedgesNeeded
  let i = 0

  if (wedgesNeeded===0) {
    return 0
  }
  
  console.log(wedgesNeeded)
  console.log(limes)
  while (i<limes.length&&x>=0) {
    console.log(i)
    console.log('x:'+x)
    switch (limes[i]) {
      case 'small':
            x = x - 6
            break;
      case 'medium':
            x = x - 8
            break;
      case 'large':
            x = x - 10
            break;
    }
    i += 1
    
    
  }
  return i
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  console.log(timeLeft+' '+orders)
  let drinksMade = 0
  let drinksMadeList = []
  while (timeLeft>0&&drinksMade<orders.length){
    timeLeft -= timeToMixJuice(orders[drinksMade])
    drinksMade++
  }
  drinksMadeList = orders.slice(drinksMade)
  return drinksMadeList
}
