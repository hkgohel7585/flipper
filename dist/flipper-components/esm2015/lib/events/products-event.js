import { BusEvent } from '@enexus/flipper-event';
export class ProductsEvent extends BusEvent {
    constructor(products) {
        super(ProductsEvent.CHANNEL);
        this.products = products;
    }
}
ProductsEvent.CHANNEL = 'products';
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoicHJvZHVjdHMtZXZlbnQuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi8uLi8uLi9wcm9qZWN0cy9mbGlwcGVyLWNvbXBvbmVudHMvc3JjL2xpYi9ldmVudHMvcHJvZHVjdHMtZXZlbnQudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUEsT0FBTyxFQUFFLFFBQVEsRUFBRSxNQUFNLHVCQUF1QixDQUFBO0FBR2hELE1BQU0sT0FBTyxhQUFjLFNBQVEsUUFBUTtJQUd6QyxZQUFtQixRQUFtQjtRQUNwQyxLQUFLLENBQUMsYUFBYSxDQUFDLE9BQU8sQ0FBQyxDQUFBO1FBRFgsYUFBUSxHQUFSLFFBQVEsQ0FBVztJQUV0QyxDQUFDOztBQUpzQixxQkFBTyxHQUFHLFVBQVUsQ0FBQSIsInNvdXJjZXNDb250ZW50IjpbImltcG9ydCB7IEJ1c0V2ZW50IH0gZnJvbSAnQGVuZXh1cy9mbGlwcGVyLWV2ZW50J1xyXG5pbXBvcnQgeyBQcm9kdWN0IH0gZnJvbSAnLi4vZW50cmllcy9wcm9kdWN0J1xyXG5cclxuZXhwb3J0IGNsYXNzIFByb2R1Y3RzRXZlbnQgZXh0ZW5kcyBCdXNFdmVudCB7XHJcbiAgcHVibGljIHN0YXRpYyByZWFkb25seSBDSEFOTkVMID0gJ3Byb2R1Y3RzJ1xyXG5cclxuICBjb25zdHJ1Y3RvcihwdWJsaWMgcHJvZHVjdHM6IFByb2R1Y3RbXSkge1xyXG4gICAgc3VwZXIoUHJvZHVjdHNFdmVudC5DSEFOTkVMKVxyXG4gIH1cclxufVxyXG4iXX0=