<?php

namespace S\VentasBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;


use Doctrine\ORM\EntityRepository;
use S\VentasBundle\Entity\Personas;
use S\VentasBundle\Entity\Eventos;

class VentasAType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('observacion', 'textarea', array('label' => 'Observación ','required' => false))
            ->add('monto1', 'text' , array('label' => 'Monto 1','required' => false))
            ->add('monto2', 'text', array('label' => 'Monto 2','required' => false))
            ->add('monto3', 'text', array('label' => 'Monto 3','required' => false));
            
            //->add('Marcar', 'submit', array('label' => 'Marcar','attr' => array('class' => 'btn btn-success','onclick'=>'return confirm("¿Desea cambiar el estatus del trabajador? Haga Click en Aceptar SI Esta Seguro")')))
            

    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'S\VentasBundle\Entity\Ventas'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 's_ventasbundle_ventas';
    }
}
