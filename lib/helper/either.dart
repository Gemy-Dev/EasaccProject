abstract class Either<L,R>{
  const Either();

  factory Either.left(L value)=Left<L,R>;
  factory Either.right(R value)=Right<L,R>;

  T matching<T>(T Function(L left) onLeft,T Function(R right) onRight );
}

// left
class Left<L,R> implements Either<L,R>{
  final L value;
  const Left(this.value);
  
  @override
  T matching<T>(T Function(L left) onLeft, T Function( R right) onRight) {
   return onLeft(value);
  }
}

// right
class Right<L,R> implements Either<L,R>{
  final R value;
  const Right(this.value);
  
  @override
  T matching<T>(T Function(L left) onLeft, T Function( R right) onRight) {
  return onRight(value);
  }
}
