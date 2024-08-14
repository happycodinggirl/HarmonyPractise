
class Point {

  x : number
  y : number

  constructor(x: number, y: number) {
    this.x = x
    this.y = y
  }

  plus(point:Point):Point{
    return new Point(this.x+point.x,this.y+point.y)
  }

  subtract(point:Point):Point{
    return new Point(this.x-point.x,this.y-point.y)
  }

  multipy(scale:number):Point{
    return new Point(this.x*scale,this.y*scale)
  }

  equals(point:Point):boolean{
    return this.x==point.x&&this.y ==point.y
  }

}

/*class PointVector extends Array<Point>  implements AnimatableArithmetic<PointVector>{
  constructor(value:Array<Point>) {
    super()
    value.forEach(p=>this.push(p))
  }

  plus(rhs: AnimatableArithmetic<PointVector>): AnimatableArithmetic<PointVector> {
    let result = new PointVector([])
    const len = Math.min(rhs.,this.length)

    for (let index = 0; index < len; index++) {
      result.push((this[index] as Point).plus(rhs[index] as Point))
    }
    return result
	}

  subtract(rhs: AnimatableArithmetic<PointVector>): AnimatableArithmetic<PointVector> {
    throw new Error('Method not implemented.')
  }

  multiply(scale: number): AnimatableArithmetic<PointVector> {
    throw new Error('Method not implemented.')
  }

  equals(rhs: AnimatableArithmetic<PointVector>): boolean {
    throw new Error('Method not implemented.')
  }

  get(): Array<Object[]> {
    let result: Array<Object[]> = []
    this.forEach(p => result.push([p.x, p.y]))
    return result
  }

}*/




@Entry
@Component
struct AnimatePropertyPage {
  @State message: string = 'Hello World';

  build() {

  }
}