import 'dart:math' as math;

double calculateBMI({required int height, required int weight}) => weight / _heightSquared(height);

double calculateBMIImperial({required int height, required int weight}) => (weight  * 703 ) / math.pow(height, 2);

double calculateMinNormalWeight({required int height}) => 18.5 * _heightSquared(height);

double calculateMaxNormalWeight({required int height}) => 25 * _heightSquared(height);


double calculateMinNormalWeightImperial({required int height}) => (18.5 / 703) * math.pow(height,2);

double calculateMaxNormalWeightImperial({required int height}) => (25.0  / 703) * math.pow(height,2);

double _heightSquared(int height) => math.pow(height / 100, 2) as double;
