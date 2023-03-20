abstract class UseCase<ReturnType, Parameters> {
  const UseCase();

  ReturnType call(Parameters parameters);
}

class EmptyParameters {}
