import { RiceCooker } from './RiceCooker';

describe('RiceCooker', () => {
  let riceCooker: RiceCooker;

  beforeEach(() => {
    riceCooker = new RiceCooker();
  });

  it('should toggle pluggedIn status when plug is called', () => {
    expect(riceCooker.pluggedIn).toBeFalsy();
    riceCooker.plug();
    expect(riceCooker.pluggedIn).toBeTruthy();
    riceCooker.plug();
    expect(riceCooker.pluggedIn).toBeFalsy();
  });

  it('should handle exceeding maxCapacity in setQuantity', () => {
    expect(riceCooker.quantity).toBe(0);
    riceCooker.setQuantity(2000);
    expect(riceCooker.quantity).toBe(2000);
    riceCooker.setQuantity(4000);
    expect(riceCooker.quantity).toBe(0)
  });

  it('should update cookTime when positive in setCookTime', () => {
    expect(riceCooker.cookTime).toBe(0);
    riceCooker.setCookTime(30);
    expect(riceCooker.cookTime).toBe(30);
    riceCooker.setCookTime(-10);
    expect(riceCooker.cookTime).toBe(0)
  });

  it('should update waterAmount when positive in setWaterAmount', () => {
    expect(riceCooker.waterAmount).toBe(0);
    riceCooker.setWaterAmount(500);
    expect(riceCooker.waterAmount).toBe(500);
    riceCooker.setWaterAmount(-50);
  });
});
