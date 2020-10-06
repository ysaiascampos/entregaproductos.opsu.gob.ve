<?php

namespace S\VentasBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class PersonasType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nacionalidad' , 'choice' , array (
            'choices' => array ('V' => 'Venezolano', 'E' => 'Extranjero')
                ,'expanded'=>'0'
                    ))
            ->add('cedula')
            ->add('primerNombre')
            ->add('segundoNombre')
            ->add('primerApellido')
            ->add('segundoApellido')
            ->add('tipoPersonal' , 'choice' , array (
            'choices' => array ('0' => 'Externo', '1' => 'Empleado Fijo', '2' => 'Empleado Contratado', '3' => 'Obrero Fijo'
                , '4' => 'Obrero Contratado', '5' => 'Docente Fijo', '6' => 'Docente Contratado', '7' => 'Jubilado', '8' => 'Comision de Servicios'
                , '9' => 'Libre Nombramiento', '10' => 'Militar', '11' => 'Honorarios Profesionales', '12' => 'Pensionado', '13' => 'Suplente'
                , '14' => 'Contratado', '15' => 'Incapacitados')
                ,'expanded'=>'0'
                ,'data'=>true
                    ))
            ->add('estatus' , 'choice' , array (
            'choices' => array ('1' => 'Activo', '3' => 'Egresado', '4' => 'Suspendido', '0' => 'Inactivo')
                ,'expanded'=>'1'
                    ))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'S\VentasBundle\Entity\Personas'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 's_ventasbundle_personas';
    }
}
