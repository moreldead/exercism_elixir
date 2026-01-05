// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Calculates the total bird count.
 *
 * @param {number[]} birdsPerDay
 * @returns {number} total bird count
 */
export function totalBirdCount(birdsPerDay) {
  let x = 0
  for (let i = 0; i < birdsPerDay.length; i++){
    x+=birdsPerDay[i]
  }
  return x  
}

/**
 * Calculates the total number of birds seen in a specific week.
 *
 * @param {number[]} birdsPerDay
 * @param {number} week
 * @returns {number} birds counted in the given week
 */
export function birdsInWeek(birdsPerDay, week) {
  let x = 0
  console.log(week)
  console.log(birdsPerDay)
  for (let i = 0; i < 7; i++) {
      
      x+=birdsPerDay[i+7*(week-1)]
      console.log(x)
  }

  return x
}

/**
 * Fixes the counting mistake by increasing the bird count
 * by one for every second day.
 *
 * @param {number[]} birdsPerDay
 * @returns {void} should not return anything
 */
export function fixBirdCountLog(birdsPerDay) {

  console.log(birdsPerDay)
  
  for (let i = 0; i < birdsPerDay.length; i=i+2){
    console.log('i='+i)
    birdsPerDay[i]=birdsPerDay[i]+1
    console.log('A:'+birdsPerDay[i])
 }
  console.log(birdsPerDay)
  return birdsPerDay
}
