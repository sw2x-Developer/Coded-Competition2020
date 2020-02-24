
/*:
 #واجب الأول ✏️
 
 أهلا وسهلاً بكم في الواجب الأول  في مسار برمجة تطبيقات الآيفون (الكويت تُبَرمج)
 
 
 في هذا الواجب سوف نقوم بكتابة كود  لحساب درجة الثانوية التراكمية مع نسبة قدرات جامعة الكويت
 ## المطلوب الأول
 قم بتعريف متغيراتك الأساسية في عملية الحساب Create and assign your variables
 نسبة الصف العاشر، و الصف الحادي عشر، و الصف الثاني عشر، و نسبة امتحانات القدرات
*/
//أكمل الكود هنا
// var grade10: Double = 80.5 :مثال
var grade10: Double = 99.9
var grade11: Double = 98.9
var grade12: Double = 99.3
var satenglish:Double = 100
var satmath: Double = 100


/*:
 - - - -
## المطلوب الثاني
 قم بتحديد النسبة (الثابتة) المأخوذة من كل مرحلة للنسبة التراكمية
*/
// أكمل الكود هنا
var percentgrade10: Double = 0.1
var percentgrade11: Double = 0.2
var percentgrade12: Double = 0.7
var percentsatenglish: Double = 0.15
var percentsatmath: Double = 0.1

/*:
 
## المطلوب الثالث
 * قم بالعملية الحسابية لحساب النسبة التراكمية
 النسبة التراكمية = (نسبة عاشر x النسبة المأخوذة)+(نسبة الحادي عشر x النسبة المأخوذة)+(نسبة الثاني عشر x النسبة المأخوذة)+(نسبة امتحان القدرات x النسبة المأخوذة)
*/
// put the code here below

var finalGrade: Double = (((grade10 * percentgrade10) + (grade11 * percentgrade11) + (grade12 * percentgrade12)) * 0.75) * ((satenglish * percentsatenglish) + (satmath * percentsatmath))

var name: String = "محمد هادي خاجه"

var age: Int = 17


/*:
 - - - -
## المطلوب الرابع
قم بطباعة
 
 أنا `الاسم` وعمري `العمر` ودرجتي الأخيرة `الدرجة`

 */
// قم بإكمال هذا الكود
print("انا " + name + " عمري " + String(age) + " و درجتي الاخيره " + String(finalGrade))

