import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'null'
})
export class NullPipe implements PipeTransform {

  transform(value: any, args?: any): string {
    return (value === null || value === undefined || value === '') ? '-' : value;
  }

}
