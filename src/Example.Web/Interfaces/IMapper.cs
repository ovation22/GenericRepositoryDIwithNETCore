namespace Example.Web.Interfaces
{
    public interface IMapper<TFrom, TTo>
    {
        TTo Map(TFrom from);
    }
}