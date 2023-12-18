export class RiceCooker {
    pluggedIn: boolean;
    status: string;
    maxCapacity: number;
    quantity: number;
    cookTime: number;
    waterAmount: number;
  
    constructor(
      pluggedIn: boolean = false,
      status: string = 'Power Off',
      maxCapacity: number = 3000,
      quantity: number = 0,
      cookTime: number = 0,
      waterAmount: number = 0
    ) {
      this.pluggedIn = pluggedIn;
      this.status = status;
      this.maxCapacity = maxCapacity;
      this.quantity = quantity;
      this.cookTime = cookTime;
      this.waterAmount = waterAmount;
    }
  
    plug(): void {
      this.pluggedIn = !this.pluggedIn;
      console.log(`Plugged in: ${this.pluggedIn ? 'On' : 'Off'}`);
    }
  
    setQuantity(newQuantity: number): void {
      if (newQuantity > this.maxCapacity) {
        this.quantity = 0
        console.log(`Error: quantity cannot exceed maximum capacity of ${this.maxCapacity}`);
      } else {
        this.quantity = newQuantity;
        console.log(`Quantity is now: ${this.quantity}`);
      }
    }
  
    setCookTime(newCookTime: number): void {
      if (newCookTime <= 0) {
        this.cookTime = 0
        console.log('Error: cook time must be positive');
      } else {
        this.cookTime = newCookTime;
        console.log(`Cook time is now: ${this.cookTime}`);
      }
    }
  
    setWaterAmount(newWaterAmount: number): void {
      if (newWaterAmount <= 0) {
        console.log('Error: water amount must be positive');
      } else {
        this.waterAmount = newWaterAmount;
        console.log(`Water amount is now: ${this.waterAmount}`);
      }
    }
  
    cookRice(): void {
      if (this.quantity <= 0) {
        console.log('You need to put the rice you want to cook in');
        return;
      }
  
      if (this.waterAmount <= 0) {
        console.log('You need to put water to be able to cook rice');
        return;
      }
  
      if (!this.pluggedIn) {
        console.log('Please turn on the rice cooker');
        return;
      }
  
      if (this.quantity > this.maxCapacity) {
        console.log('Too much rice, the cooker cannot handle it');
        return;
      }
  
      console.log(`Cooking ${this.quantity}g of rice`);
      console.log(`This will take approximately ${this.cookTime} minutes`);
    }
  }