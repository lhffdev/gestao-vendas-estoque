import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'pluralize'
})
export class PluralizePipe implements PipeTransform {

  transform(value: any, singular: string, plural: string): string {
    if (!value && value !== 0) {
      return value;
    }

    return `${value} ${value === 1 ? singular : plural}`;
  }

}
